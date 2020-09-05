class Session
    def initialize
        @user = nil
    end

    def getUser()
        return @user
    end

    def setUser(user)
        @user = user
    end
end