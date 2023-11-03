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
    pivot_longer(everything(), names_to = c("perc", "dim"), names_sep = 3) |>
    pivot_wider(names_from = "dim")
}

plot_model <- function(d_raw, d_pred, dts, local_cutoff) {
  ymax <- max(c(d_raw$count, d_pred$ci99_upper))
  
  ggplot(data = d_pred, mapping = aes(x = doy, y = count)) +
    theme_bw() +
    annotate(geom = "rect", xmin = dts$x[1], xmax = dts$x[4], ymin = 0, ymax = Inf, 
             colour = NA, fill = "red", alpha = 0.1) +
    annotate(geom = "rect", xmin = dts$x[2], xmax = dts$x[3], ymin = 0, ymax = Inf, 
             colour = NA, fill = "red", alpha = 0.3) +
    annotate(geom = "text", x = dts$x[1] * 1.015, y = ymax * 0.9,
             label = "5%-95%") +
    annotate(geom = "text", x = dts$x[2] + (dts$x[3] - dts$x[2])/2, y = ymax * 0.9,
             label = "25%-75%") +
    geom_ribbon(aes(ymin = ci99_lower, ymax = ci99_upper), fill = "grey50", alpha = 0.5) +
    geom_point(data = d_raw) +
    geom_line() +
    geom_point(data = dts, aes(x = x, y = y), colour = "red", size = 3) +
    annotate(geom = "segment", x = min(d_pred$doy), xend = local_cutoff, 
             y = 50, yend = 50, 
             arrow = arrow(ends = "both", length = unit(2, "mm"))) +
    annotate(geom = "text", label = "Local Count", fontface = "bold", 
             x = 220, y = max(d_raw$count) * 0.85,
             hjust = "left", vjust = "top") +
    annotate(geom = "text", 
             label = glue::glue_data(
               local, 
               "min: {min}\nmax: {max}\nmedian: {median}\nmean: {mean}"), 
             hjust = "left", vjust = "top", x = 220, y = max(d_raw$count)*0.7)  +
    scale_x_continuous(name = "Day of Year", limits = c(203, 291)) +
    labs(y = "Count")
}

plot_cum <- function(d_sum, dts) {
  ggplot(data = d_sum, aes(x = doy, y = count_sum)) +
    theme_bw() +
    geom_bar(stat = "identity") +
    geom_hline(yintercept = c(0.05, 0.25, 0.75, 0.95) * max(d_sum$count_sum), 
               linetype = "dotted") +
    geom_point(data = dts, aes(x = x, y = y1), colour = "red", size = 3) +
    scale_x_continuous(name = "Day of Year", limits = c(203, 291)) +
    labs(y = "Cumulative count")
}