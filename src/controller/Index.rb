class Index < AbstractController
    def initialize
    end

    def ejecutar(dato)
        dato["parametro"] = "Index"
        redirect("login")
    end

    def getErbFile()
        componerRutaView("index.erb")
    end
end