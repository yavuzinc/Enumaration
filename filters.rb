# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Takes in an id
  # Returns the candidate with that :id
  # If there is no candidate with that id, it naturally returns nil
  @candidates.each do |candidate|
    if candidate[:id] == id
      pp candidate
    else
      nil
    end
  end
end

def ordered_by_qualifications(candidates)

  pp candidates.sort_by{ |c| [c[:years_of_experience], c[:github_points]] }

end




def qualified_candidates(candidates)
  candidates.each do |candidate|
    if experienced?(candidate) && github_pt_check?(candidate) && ruby_python_check?(candidate) && age_over_17?(candidate) && application_date?(candidate)
      pp candidate
    end
  end
end

# More methods will go below
def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    @experienced = true
  else
    @experienced = false
  end
end

def github_pt_check?(candidate)
  if candidate[:github_points] >= 100
    @check = true
  else
    @check = false
  end
end

def ruby_python_check?(candidate)
  if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
    @check = true
  else
    @check = false
  end
end

def application_date?(candidate)
  if (candidate[:date_applied][0].to_i <= 15)
    @check = true
  else
    @check = false
  end
end

def age_over_17?(candidate)
  if candidate[:age] > 17
    @check = true
  else
    @check = false
  end
end

