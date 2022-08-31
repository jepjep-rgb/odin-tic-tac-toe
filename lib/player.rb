class Player
    @@markers = []

    attr_reader :name, :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
        @@markers << marker
    end
end