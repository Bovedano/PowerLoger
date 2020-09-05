class User
    def initialize
        @nombre = ""
        @idioma = ""
    end

    def setNombre(nombre)
        @nombre = nombre
    end

    def getNombre()
        return @nombre
    end

    def setIdioma(idioma)
        @idioma = idioma
    end

    def getIdioma
        return @idioma
    end
end