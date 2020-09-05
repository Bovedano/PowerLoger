

def mapController(params, direccionamiento)
    page = params["page"]
    retorno = nil
    #Se obtiene el creador del controlador
    controllerCreator = direccionamiento.getControllerCreator(page)
    if(controllerCreator != nil)
        #Si existe el creador del controlador, se crea el controlador
        controller = controllerCreator.()
        if(controller != nil)
            #Se añaden los parametros al controldor
            controller.setParams(params)
            #Si existe el controlador se mapea
            $LOGS.navegacion(controller)
            retorno = controller.map()
            #Control para redirecciones dentro de los controladores
            if(controller.getRedireccion())
                retorno = mapController(controller.getParams(),direccionamiento)
            end
        end
    end
    p controller
    return retorno;
end

############################### RUTAS ##############################
def procesarPeticion(params)
    if($DEBUG)
        #reload()
    end
    page = params["page"]
    if(page == nil || page == "")
        params["page"] = "index"
    end

    direccionamiento = Direccionamiento.new()
    begin
        code = mapController(params,direccionamiento);
    rescue => exception
        $LOGS.exception(exception.inspect)
        code = nil
        if($DEBUG)
            raise exception
        end
    end
    
    if(code == nil)
        code = "ERROR"
    end
    return code;
end

get '/' do
    procesarPeticion(params)
end

post '/' do
    procesarPeticion(params)
end

get '/image' do
    imagen = params["image"]
    file = $DIRECTORIO_SERVER + "/view/img/" + imagen
    send_file file
end

get '/js' do
    js = params["js"]
    file = $DIRECTORIO_SERVER + "/view/js/" + js
    send_file file
end

get '/css' do
    css = params["css"]
    file = $DIRECTORIO_SERVER + "/view/css/" + css
    send_file file
end

