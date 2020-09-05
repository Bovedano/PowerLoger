class Login < AbstractController
    def initialize
    end

    def ejecutar(dato)
        dato["login"] = "Logiss"
    end

    def getErbFile()
        componerRutaView("login/login.erb")
    end
end