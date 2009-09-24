Kisaweb
=======

Kisaweb on Ruby-kirjasto yhteydenpitoon Suomen Suunnistusliiton Kisawebin API:n kanssa.

Esimerkki:

    Kisaweb::OnlineRanki.find("D16")

hakee D16-sarjan tämänhetkisen online-rankilistan.    
    
    OnlineRanki.find("D16").first.runner.first_name
    => "Emmi"
    
    OnlineRanki.find("D16").first.runs.map do |run|
      [run.contest_id, run.points.to_f]}
    end
    => [["9532", 76.45], ["9527", 73.22], ["9526", 70.63],
        ["9581", 70.51], ["9482", 67.02]]
    
  
