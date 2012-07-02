module QualificationsHelper

  def colorQualificationClass(total)
    if Qualification.where("total >= ?", total).count > 64
      2
    else
      1
    end
  end

end

