class UserBlueprint < Blueprinter::Base
    identifier :id

    fields :username, :created_at, :updated_at
end