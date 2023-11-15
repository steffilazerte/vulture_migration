calc_dates <- function(x) {
  x |>
    summarize(p05y1 = 0.05 * max(count_sum),
              p05x = doy[count_sum >= p05y1][1],
              p05y = count[count_sum >= p05y1][1],
              
              p25y1 = 0.25 * max(count_sum),
              p25x = doy[count_sum >= p25y1][1],
              p25y = count[count_sum >= p25y1][1],
              
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
    geom_hline(yintercept = c(0.05, 0.25, 0.75, 0.95) * max(d_sum$count_sum, na.rm = TRUE), 
               linetype = "dotted") +
    geom_point(data = dts, aes(x = doy_passage, y = count_thresh), colour = "red", size = 3) +
    scale_x_continuous(name = "Day of Year", limits = c(203, 295)) +
    labs(y = "Cumulative count")
}

plot_model_explore <- function(d_raw, d_pred, dts, residents, resident_date) {
  ymax <- max(c(d_raw$count, d_pred$ci99_upper), na.rm = TRUE)
  
  ggplot(data = d_pred, mapping = aes(x = doy, y = count)) +
    theme_bw() +
    annotate(geom = "rect", xmin = dts$doy_passage[1], xmax = dts$doy_passage[4], ymin = 0, ymax = Inf, 
             colour = NA, fill = "red", alpha = 0.1) +
    annotate(geom = "rect", xmin = dts$doy_passage[2], xmax = dts$doy_passage[3], ymin = 0, ymax = Inf, 
             colour = NA, fill = "red", alpha = 0.3) +
    annotate(geom = "text", x = dts$doy_passage[1] * 1.015, y = ymax * 0.9,
             label = "5%-95%") +
    annotate(geom = "text", x = dts$doy_passage[2] + (dts$doy_passage[3] - dts$doy_passage[2])/2, y = ymax * 0.9,
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
    geom_hline(yintercept = c(0.05, 0.25, 0.75, 0.95) * max(d_sum$count_sum, na.rm = TRUE), 
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
