calc_dates <- function(x) {
  x |>
    summarize(p05y1 = 0.05 * max(count_sum),
              p05x = doy[count_sum >= p05y1][1],
              p05y = count[count_sum >= p05y1][1],
              
              p25y1 = 0.25 * max(count_sum),
              p25x = doy[count_sum >= p25y1][1],
              p25y = count[count_sum >= p25y1][1],
              
              p50y1 = 0.5 * max(count_sum),
              p50x = doy[count_sum >= p50y1][1],
              p50y = count[count_sum >= p50y1][1],
              
              p75y1 = 0.75 * max(count_sum),
              p75x = doy[count_sum >= p75y1][1],
              p75y = count[count_sum >= p75y1][1],
              
              p95y1 = 0.95 * max(count_sum),
              p95x = doy[count_sum >= p95y1][1],
              p95y = count[count_sum >= p95y1][1]) |>
    pivot_longer(-any_of("year"), names_to = c("perc", "dim"), names_sep = 3) |>
    pivot_wider(names_from = "dim") |>
    rename("doy_passage" = "x", "count_thresh" = "y1", "count_pred" = "y")
}

plot_model <- function(raw, pred, final = NULL) {
  ymax <- max(c(raw$count, pred$ci99_upper), na.rm = TRUE)
  
  g <- ggplot(data = pred, mapping = aes(x = doy, y = count)) +
    theme_bw() +
    geom_ribbon(aes(ymin = ci99_lower, ymax = ci99_upper), fill = "grey50", alpha = 0.5) +
    geom_point(data = raw, na.rm = TRUE) +
    geom_line() +
    scale_x_continuous(name = "Day of Year", limits = c(203, 295)) +
    labs(y = "Count")
  
  if(!is.null(final)) g <- g + annotate(geom = "text", x = -Inf, y = +Inf, hjust = -0.1, vjust = 1.1, label = paste0("n days = ", final$n_dates_obs))
  g
}

plot_cum <- function(d_sum, dts) {
  ggplot(data = d_sum, aes(x = doy, y = count_sum)) +
    theme_bw() +
    geom_bar(stat = "identity") +
    geom_hline(yintercept = c(0.05, 0.25, 0.5, 0.75, 0.95) * max(d_sum$count_sum, na.rm = TRUE), 
               linetype = "dotted") +
    geom_point(data = dts, aes(x = doy_passage, y = count_thresh), colour = "red", size = 3) +
    scale_x_continuous(name = "Day of Year", limits = c(203, 295)) +
    labs(y = "Cumulative count")
}

plot_model_explore <- function(d_raw, d_pred, dts, residents, resident_date) {
  ymax <- max(c(d_raw$count, d_pred$ci99_upper), na.rm = TRUE)
  
  ggplot(data = d_pred, mapping = aes(x = doy, y = count)) +
    theme_bw() +
    annotate(geom = "rect", xmin = dts$doy_passage[1], xmax = dts$doy_passage[5], ymin = 0, ymax = Inf, 
             colour = NA, fill = "red", alpha = 0.1) +
    annotate(geom = "rect", xmin = dts$doy_passage[2], xmax = dts$doy_passage[4], ymin = 0, ymax = Inf, 
             colour = NA, fill = "red", alpha = 0.3) +
    annotate(geom = "text", 
             x = dts$doy_passage[1] * 1.015, y = ymax * 0.9,
             label = "5%-95%") +
    annotate(geom = "text", 
             x = dts$doy_passage[2] + (dts$doy_passage[4] - dts$doy_passage[2])/2, y = ymax * 0.9,
             label = "25%-75%") +
    geom_ribbon(aes(ymin = ci99_lower, ymax = ci99_upper), fill = "grey50", alpha = 0.5) +
    geom_point(data = d_raw, na.rm = TRUE) +
    geom_line() +
    geom_point(data = dts, aes(x = doy_passage, y = count_pred), colour = "red", size = 3) +
    annotate(geom = "segment", x = min(d_pred$doy), xend = resident_date, 
             y = 50, yend = 50, 
             arrow = arrow(ends = "both", length = unit(2, "mm"))) +
    annotate(geom = "text", label = "Resident Count", fontface = "bold", 
             x = 220, y = max(d_raw$count, na.rm = TRUE) * 0.85,
             hjust = "left", vjust = "top") +
    annotate(geom = "text", 
             label = glue::glue_data(
               residents, 
               "min: {res_pop_min}\nmax: {res_pop_max}\nmedian: {res_pop_median}\nmean: {res_pop_mean}"), 
             hjust = "left", vjust = "top", x = 220, y = max(d_raw$count, na.rm = TRUE)*0.7)  +
    scale_x_continuous(name = "Day of Year", limits = c(203, 295)) +
    labs(y = "Count")
}

plot_cum_explore <- function(d_sum, dts) {
  ggplot(data = d_sum, aes(x = doy, y = count_sum)) +
    theme_bw() +
    geom_bar(stat = "identity") +
    geom_hline(yintercept = c(0.05, 0.25, 0.5, 0.75, 0.95) * max(d_sum$count_sum, na.rm = TRUE), 
               linetype = "dotted") +
    geom_point(data = dts, aes(x = doy_passage, y = count_thresh), colour = "red", size = 3) +
    scale_x_continuous(name = "Day of Year", limits = c(203, 295)) +
    labs(y = "Cumulative count")
}

gam_check <- function(g, year) {
  
  if(!dir.exists(d <- "Figures/GAM checks/")) dir.create(d, recursive = TRUE)
  f <- file.path(d, paste0("gam_check_", year, ".png"))
  png(file = f, width = 1000, height = 400, res = 100)
  p0 <- par(mfrow = c(2,2), mar = c(2,2,2,2))
  o <- capture.output(gam.check(g, k.rep = 1000))
  par(p0)
  dev.off()
  
  t <- str_split(o[12:13], " +", simplify = TRUE)
  t <- t[, -6]
  t[1,1] <- "param"
  colnames(t) <- as.vector(t[1,])
  t <- as_tibble(t)
  t <- slice(t, -1) |>
    mutate(convergence = str_subset(o, "convergence"),
           full_convergence = str_detect(convergence, "full")) |>
    janitor::clean_names()
  
  list(plot = f, checks = t)
}

lm_coefs <- function(x) {
  bind_cols(model = as.character(x$call)[2], 
            tidy(x),
            select(glance(x), n = nobs, contains("r.squ"), 
                   model_f = statistic, model_p = p.value))
}

glm_coefs <- function(x) {
  bind_cols(model = as.character(x$call)[2], 
            tidy(x),
            select(glance(x), n = nobs)) |>
    mutate(estimate_exp = exp(estimate)) |>
    relocate(estimate_exp, .after = estimate)
}

get_table <- function(models) {
  if(inherits(models[[1]], "glm")) f <- glm_coefs else f <- lm_coefs
  map(models, f) |>
    bind_rows() |>
    rename_with(\(x) str_replace_all(x, "\\.", "_")) |>
    rename_with(\(x) str_replace(x, "^(r_|adj_r)", "model_\\1")) 
}

fmt_table <- function(t) {
  ft <- t |>
    mutate(
      #model_p = round(model_p, 3),
      #model_p = if_else(model_p <= 0.05, paste0("<strong>", model_p, "</strong>"), as.character(model_p)),
      row_group = md(paste0("<strong>", model, "</strong>")))
  
  if("model_r_squared" %in% names(t)) {
    ft <- ft |>
      mutate(row_group = md(paste0(row_group, 
                                   " <small>(",
                                   #"<br><small>(F = ", round(model_f, 2), "; ",
                                   #"P = ", model_p, "; ",
                                   "R2 = ", round(model_r_squared, 2), "; ",
                                   "R2-adj = ", round(model_adj_r_squared, 2), 
                                   ")</small>")))
  }
  
  ft |> 
    select(-starts_with("model")) |>
    group_by(row_group) |>
    rename_with(\(x) str_replace_all(x, "\\.|\\_", " ")) |>
    gt() |>
    gt_theme() |>
    tab_style(cell_text(transform = "capitalize", weight = "bold"), 
              locations = cells_column_labels()) |>
    text_transform(locations = cells_row_groups(), fn = \(x) map(x, html)) |>
    fmt_number(columns = -1, decimals = 3) |>
    fmt_number(columns = any_of(c("n", "df")), decimals = 0) |>
    tab_style(style = cell_text(weight = "bold"), 
              locations = cells_body(
                columns = `p value`, rows = `p value` <= 0.05))
}

gt_theme <- function(data, ...) {
  data |>
    tab_options(
      table.border.top.width = px(3), 
      table.width = "80%",
      column_labels.font.weight = "bold",
      column_labels.border.bottom.width = px(3),
      data_row.padding = px(7),
      ...
    )
}

gt_cooks <- function(cooks, width = "40%") {
  col <- names(cooks)[-1]
  g <- gt(cooks) |>
    fmt_number(-"year", decimals = 2)
  
  for(i in col) {
    g <- tab_style(g, style = list(cell_fill(color = "#F9E3D6")),
                   cells_body(columns = contains(i), 
                              rows = .data[[i]] > 4/25))
  }

  g |>
    gt_theme() |>
    tab_header("Cook's Distances") |>
    tab_options(table.width = width)
}


get_cooks <- function(models) {
  cbind(
    year = v$year,
    map(models, \(x) {
      data.frame(cooks = cooks.distance(x)) |>
        rename_with(~ str_remove(as.character(x$call)[2], " ~ year"))
    }) |>list_cbind()
  )
}

compare <- function(model, y) {
  
  pal <- RColorBrewer::brewer.pal(n = 9, "Greens")[-c(1,2,3,9)]
  
  m <- paste0(c("Original - ", paste0("Drop ", y, " - ")), 
              str_remove(as.character(model$call)[2], " ~ year"))
  c <- rbind(
    as.data.frame(coef(summary(model)))|>
      rownames_to_column("parameter"),
    as.data.frame(coef(summary(update(model, data = filter(v, year != y))))) |>
      rownames_to_column("parameter")
  ) |>
    mutate(across(-"parameter", \(x) round(x, digits = 3)))
  cbind(model = sort(rep(m, nrow(c)/2), decreasing = TRUE), c) |>
    arrange(parameter) |>
    gt() |>
    gt_theme() |>
    data_color(columns = matches("Estimate"),
               rows = c(last_col() - 1, last_col()),
               palette = pal, reverse = c$Estimate[nrow(c)] < 0) |>
    data_color(columns = matches("Pr"),
               rows = c(last_col() - 1, last_col()), reverse = TRUE,
               palette = pal)
}



model_check_figs <- function(models) {
  for(i in models) {
    p0 <- par(mar = c(4, 4, 4, 0))
    t <- as.character(i$call)[2]
    simulateResiduals(i, plot = TRUE)
    mtext(t, line = 1, at = -0.1)
    par(p0)
  }
}

desc_stats <- function(data) {
  data |>
    pivot_longer(cols = everything(), names_to = "measure") |>
    summarize(mean = mean(value), 
              sd = sd(value),
              min = min(value),
              median = median(value),
              max = max(value),
              n = n(),
              .by = "measure") |>
    gt() |>
    gt_theme() |>
    fmt_number(columns = c(mean, sd), decimals = 2)
}
  
fmt_anova <- function(m) {
  car::Anova(m, type = "III") |>
    as_tibble(rownames = "Parameter") |>
    rename("P" = "Pr(>F)", "F" = "F value") |>
    gt() |>
    tab_style(style = cell_text(weight = "bold"), 
              locations = cells_body(
                columns = P, rows = P <= 0.05)) |>
    fmt_number(columns = -Df, decimals = 3)
}

fmt_prep <- function(m) {
  summary(m) |>
    coef() |> 
    as_tibble(rownames = "Parameter") |>
    mutate(model = as.character(m$call)[2]) |>
    rename("P" = starts_with("Pr"),
           "T" = any_of("t value"),
           "Z" = any_of("z value")) |>
    relocate(model)
}

fmt_summary <- function(m, intercept = TRUE) {
  if(inherits(m, "lm")) {
    t <- fmt_prep(m) 
  } else {
    t <- map(m, fmt_prep) |> 
      bind_rows()
  }
  if(!intercept) t <- filter(t, !str_detect(Parameter, "(I|i)ntercept"))
  t |>
    #group_by(pick(any_of("model"))) |>
    gt() |>
    tab_style(style = cell_text(weight = "bold"), 
              locations = cells_body(
                columns = P, rows = P <= 0.05)) |>
    tab_style(style = cell_text(weight = "bold"), 
              locations = cells_body(columns = model)) |>
    fmt_number(decimals = 3)
}

fmt_emmeans <- function(m, adjust = "FDR") {
  emmeans::emtrends(m, ~ measure, var = "year") |> 
    emmeans::test(adjust = adjust) |>
    as_tibble() |>
    rename(slope = year.trend, P = p.value, `T` = t.ratio) |>
    rename_with(tools::toTitleCase) |>
    gt() |>
    tab_style(style = cell_text(weight = "bold"), 
              locations = cells_body(
                columns = P, rows = P <= 0.05)) |>
    fmt_number(columns = -Df, decimals = 3) |>
    tab_footnote(paste0(adjust, " P-value adjustment"))
}
