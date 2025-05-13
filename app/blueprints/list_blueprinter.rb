class ListBLueprint < Blueprinter::Base
    identifier :id

    fields :title, :content
    association :user. blueprint: UserBlueprint
end