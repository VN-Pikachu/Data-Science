for (fire in 1:nrow(StudyArea)) {
    if(StudyArea[fire, "TOTALACRES"] > 100000) {
        print(paste("100K Fire: ", StudyArea[fire, "FIRENAME"], sep = ""))
    }
    else if (StudyArea[fire, "TOTALACRES"] > 75000) {
      print(paste("75K Fire: ", StudyArea[fire, "FIRENAME"], sep = ""))
    }
    else if (StudyArea[fire, "TOTALACRES"] > 50000) {
      print(paste("50K Fire: ", StudyArea[fire, "FIRENAME"], sep = ""))
    }
    else {
      print("Not a MEGAFIRE")
    }
}