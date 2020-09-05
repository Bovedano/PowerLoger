class Autenticate < AbstractController
    def initialize
        #@usuario = params["uname"]
        #@pass = params["psw"]
    end

    def ejecutar(dato)
        user = @params["uname"]
        pass = @params["psw"]
        if validate(user, pass)
            redirect("userpanel")
        else
            redirect("login")
        end
    end

    def validate(user, pass)
        if(user != nil && pass != nil)
            return true
        end   
        return false
    end

    def getErbFile()
        return nil
    end
    
end