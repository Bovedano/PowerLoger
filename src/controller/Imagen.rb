class Imagen < AbstractController
    def initialize
    end

    def ejecutar(dato)
        dato["parametro"] = "Imagenes"
        redirect("login")
    end

    def getErbFile()
        componerRutaView("index.erb")
    end
end