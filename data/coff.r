observation <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
cal_mean <- function(observation) {
  sum_observation <- sum(observation)
  nbr <- length(observation)
  mean_value <- sum_observation / nbr
  (mean_value)
}

cal_mean(observation)


cal_SD <- function(observation) {
  mean_value <- cal_mean(observation)
  sum_of_squares <- sum((observation - mean_value)^2)
  sd_value <- (sum_of_squares / length(observation) - 1)^0.5
  return(sd_value)
}

sd_value <- cal_SD(observation)
mean_value <- cal_mean(observation)

cal_cv <- function(sd_value, mean_value) {
  cal_SD <- sd_value
  cal_mean <- mean_value
  cal_cv <- cal_SD / cal_mean
  return(cal_cv)
}

cv <- cal_cv(sd_value, mean_value)

percentage_CV <- function(cv) {
  cal_cv <- cal_cv / 100
  cal_cv
}

percentage_CV(cv)
