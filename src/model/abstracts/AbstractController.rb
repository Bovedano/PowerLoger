require 'erb'
class AbstractController
    def initialize
        raise "No se puede inicializar la clas abtracta AbstractController"
    end

    def setParams(params)
        @params = params
    end

    def map()
        @redireccion = false

        #Carga de literales
        @literal = Hash.new 

        #Carga de propiedades
        @propiedad = Hash.new 

        #Carga de datos
        @dato = Hash.new
        ejecutar(@dato)

        file = nil
        begin
            file = File.open(getErbFile())
        rescue => exception
            
        end
        
        if(file != nil)
            erb = ERB.new(file.read)
            return erb.result(binding)
        end
        return ""
    end

    #Obtiene el fichero erb asociado al controlador
    def getErbFile()
        raise "Metodo getErbFile() no implementado para " + self.class.name
    end

    def ejecutar(dato)
        raise "Metodo getErbFile() no implementado para " + self.class.name
    end

    def componerRutaView(nombre)
        return $DIRECTORIO_SERVER+"/view/" + nombre
    end

    def redirect(page)
        @redireccion = true
        @params["page"] = page
    end

    def getRedireccion()
        return @redireccion
    end

    def getPage()
        return @page
    end

    def getParams()
        return @params
    end
end