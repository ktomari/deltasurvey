
#' Convert columns with missing values in the form of &lt;angle brackets&gt; to `NA`.
#'
#' @param .data A data.frame or tibble consisting of the data from the DRS.
#'
#' @return A data.frame or tibble.
#' @export
#'
#' @examples
#' df <- data.frame(Q0_0 = c("1", "<Missing>", "3"))
#' drs_as_NA(df)
drs_as_NA <- function(
    .data
){
  stopifnot(
    base::is.data.frame(.data) ||
      tibble::is_tibble(.data)
  )
  .data %>%
    dplyr::mutate(
      # change columns that are of type character.
      dplyr::across(.cols = tidyselect::where(base::is.character),
             .fns = ~ dplyr::case_when(
               # When string with angle brackets detected,
               # assign NA value.
               stringr::str_detect(.x, "\\<.+\\>") ~
                 NA_character_,
               # Otherwise, return string.
               TRUE ~ .x)
      ),
      # change columns that are of type factor.
      dplyr::across(.cols = tidyselect::where(base::is.factor),
             .fns = ~ dplyr::case_when(
               # When factor with angle brackets detected,
               # assign NA value.
               stringr::str_detect(as.character(.x), "\\<.+\\>") ~
                 NA_character_,
               # Otherwise, return factor.
               TRUE ~ base::as.character(.x)
             ) %>%
               # Then convert to factor, and
               # drop any empty levels,
               # ie. factors w/ angle brackets.
               base::factor() %>%
               forcats::fct_drop()

      )
    )
}
