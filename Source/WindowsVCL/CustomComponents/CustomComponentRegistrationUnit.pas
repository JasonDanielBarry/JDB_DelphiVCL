unit CustomComponentRegistrationUnit;

interface

    uses
        System.Classes,
        CustomStringGridClass
        ;

    procedure register();

implementation

    procedure register();
        begin
            RegisterComponents(
                                    'JDBDelphiLibrary',
                                    [
                                        TJDBStringGrid
                                    ]
                              );
        end;

end.
