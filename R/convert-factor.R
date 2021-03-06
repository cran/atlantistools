#' Function to convert any column with information about functional groups
#' to a factor whose levels use the LongName of the functional groups file.
#'
#' This function is used to match the labels of the plots!
#'
#' @param data_fgs Dataframe with information about functionalGroups.
#' Usually loaded with load_fgs().
#' @param col Column of the dataframe which is converted to a factor.
#' @return Column of a dataframe in factor format.
#' @export
#' @family convert functions

convert_factor <- function(data_fgs, col) {
  set_factor <- function(col_fgs, col, data_fgs) {
    labels <- sort(data_fgs$LongName[is.element(col_fgs, unique(col))])
    fac_levels <- col_fgs[sapply(labels, function(x) which(data_fgs$LongName == x))]
    # if (diet & is.element("Rest", unique(col))) {
    #   fac_levels <- c(fac_levels, "Rest")
    #   labels <- c(labels, "Rest")
    # }
    col <- as.character(factor(col, levels = fac_levels, labels = labels))
    return(col)
  }

  avail <- unique(col)
  # Create vector of sorted labels!
  if (all(is.element(avail, data_fgs$Code))) {
    col <- set_factor(col_fgs = data_fgs$Code, col = col, data_fgs = data_fgs)
    return(col)
  } else {
    if (all(is.element(avail, data_fgs$Name))) {
      col <- set_factor(col_fgs = data_fgs$Name, col = col, data_fgs = data_fgs)
      return(col)
    } else {
      # Add pesky sediment groups!
      ids <- (nrow(data_fgs) - 2):nrow(data_fgs)
      data_fgs <- rbind(data_fgs, data_fgs[ids, ])
      data_fgs[ids + 3, "Code"] <- paste0(data_fgs[ids + 3, "Code"], "sed")
      data_fgs[ids + 3, "LongName"] <- paste0(data_fgs[ids + 3, "LongName"], "_sed")
      if (all(is.element(avail, data_fgs$Code))) {
        col <- set_factor(col_fgs = data_fgs$Code, col = col, data_fgs = data_fgs)
        return(col)
      } else {
        stop("Not all entries in column Code (or Name) match the entries in parameter col!")
      }
    }
  }
}





