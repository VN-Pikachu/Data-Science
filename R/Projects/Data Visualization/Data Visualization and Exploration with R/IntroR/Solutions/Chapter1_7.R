reportFireInfo = function(df, colSize, colName) {
  for (fire in 1:nrow(df)) {
    if(StudyArea[fire, col] > 100000) {
      outMsg = paste("100K Fire: ", df[fire, colName], sep = "")
      #print(paste("100K Fire: ", df[fire, colName], sep = ""))
    }
    else if (df[fire, colSize] > 75000) {
      outMsg = paste("75K Fire: ", df[fire, colName], sep = "")
      #print(paste("75K Fire: ", df[fire, colName], sep = ""))
    }
    else if (df[fire, colSize] > 50000) {
      outMsg = paste("50K Fire: ", df[fire, colName], sep = "")
      #print(paste("50K Fire: ", df[fire, colName], sep = ""))
    }
    else {
      outMsg = "Not a MEGAFIRE"
      print("Not a MEGAFIRE")
    }
    
    return(outMsg)
  }
}

reportFireInfo(StudyArea, "TOTALACRES", "FIRENAME")

