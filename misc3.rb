array = "Jan 7"

array ||= self.data.split(/\n/).reject{ |s| s.nil? || s == "" }.map{ |s| s.strip.split(/\s+/) }
