
[1mFrom:[0m /home/loborich/pprojects/af-vault/app/controllers/reservists_controller.rb:71 ReservistsController#search:

    [1;34m61[0m: [32mdef[0m [1;34msearch[0m
    [1;34m62[0m:   results = [1;34;4mGeocoder[0m.search(
    [1;34m63[0m:     params[[33m:query[0m],
    [1;34m64[0m:     [35mparams[0m: {
    [1;34m65[0m:       [35mcountrycodes[0m: [31m[1;31m"[0m[31mph[1;31m"[0m[31m[0m, [1;34m# Philippines only[0m
    [1;34m66[0m:       [35maddressdetails[0m: [1;34m1[0m,
    [1;34m67[0m:       [35mlimit[0m: [1;34m5[0m
    [1;34m68[0m:     }
    [1;34m69[0m:   )
    [1;34m70[0m:   
 => [1;34m71[0m:   binding.pry
    [1;34m72[0m:   
    [1;34m73[0m:   render [35mjson[0m: results.map { |r|
    [1;34m74[0m:     {
    [1;34m75[0m:       [35mlabel[0m: r.display_name,
    [1;34m76[0m:       [35mlatitude[0m: r.latitude,
    [1;34m77[0m:       [35mlongitude[0m: r.longitude
    [1;34m78[0m:     }
    [1;34m79[0m:   }
    [1;34m80[0m:   
    [1;34m81[0m: [32mend[0m

