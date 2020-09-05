class Logger
    def initialize
    end

    def info(log)
        write(log, "ERR", "logs")
    end

    def error(log)
        write(log, "INF", "logs")
    end

    def exception(log)
        write(log, "EXC", "exception")
    end

    def navegacion(controller)
        log = ""
        page = ""
        plant =""
        params = controller.getParams()
        plantilla = controller.getErbFile()
        if(plantilla != nil)
            plant = plantilla
        end
        params.each do |key, value|
            if (key == "page")
                page = value
            else
                log = log + "#{key}=#{value} ; "
            end
        end
        log = page + " ["+log+"] -> " + plant
        write(log, "NAV","navegacion")
    end

    def write(log, type, file)
        t = Time.now
        time = t.strftime("%d/%m/%Y %H:%M:%S")
        path = $DIRECTORIO_SERVER + "/logs/"
        ext = ".log"
        fichero = path + file + ext
        cadena = "[" + time + "] " + type + ": " + log + "\n"
        File.write(fichero, cadena, mode: "a")
    end

    def setNavegacion()
        @file = "navegacion"
    end
end