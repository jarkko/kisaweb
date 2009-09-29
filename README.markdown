Kisaweb
=======

Kisaweb on Ruby-kirjasto yhteydenpitoon Suomen Suunnistusliiton Kisawebin API:n kanssa.

Esimerkki:

    Kisaweb::OnlineRanki.find("D16")

hakee D16-sarjan tämänhetkisen online-rankilistan.    
    
    include Kisaweb
    
    OnlineRanki.find("D16").first.runner.first_name
    => "Emmi"
    
    OnlineRanki.find("D16").first.runs.map do |run|
      [run.contest.title, run.points.to_f]
    end
    => [["SM-keskimatka R1", 76.45], 
        ["SM-pitkä matka R1", 73.22], 
        ["Oravatonni", 70.83], 
        ["SM-pitkä matka R1", 70.63], 
        ["Häme-AM", 70.51]]
    
    
  
