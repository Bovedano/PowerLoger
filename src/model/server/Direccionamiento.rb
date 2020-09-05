class Direccionamiento
    def initialize
        @controllers = Hash.new()
        inicializa()
    end

    def inicializa()
        @controllers["index"] = -> { return Index.new() }
        @controllers["login"] = -> { return Login.new() }
        @controllers["userpanel"] = -> { return UserPanel.new() }
        @controllers["autenticate"] = -> { return Autenticate.new() }
    end

    def getControllerCreator(nombre)
        return @controllers[nombre]
    end
end