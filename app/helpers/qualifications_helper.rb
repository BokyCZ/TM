module QualificationsHelper

  def colorQualificationClass(total)
    if Qualification.where("total >= ?", total).count > 64
      1
    else
      0
    end
  end

end

