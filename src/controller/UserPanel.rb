class UserPanel < AbstractController
    def initialize
    end

    def ejecutar(dato)
        dato["userPanel"] = "userPanel"
    end

    def getErbFile()
        componerRutaView("userpanel/userpanel.erb")
    end
end