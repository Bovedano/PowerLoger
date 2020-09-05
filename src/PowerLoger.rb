require "sinatra"

#Modo debug
$DEBUG = true

#Ruta del proyecto
$DIRECTORIO_SERVER = File.expand_path(File.dirname(__FILE__))


#Recarga todas las clases del servidor excepto esta
def cargarClases()
    #Cargador de clases abstractas
    Dir[$DIRECTORIO_SERVER+ "/model/abstracts/*.rb"].each {|file| 
        load file 
        p file
    }

    Dir[$DIRECTORIO_SERVER+ "/*/**/*.rb"].each {|file| 
        load file 
    }
end


def reload()
    cargarClases()
    #Carga del sistema
    loadSystem = LoadSystem.new()
    #Nueva sesion
    $SESSION = Session.new()
    $LOGS = Logger.new()    
end



reload()

