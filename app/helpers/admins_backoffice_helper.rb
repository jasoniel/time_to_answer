module AdminsBackofficeHelper

    def translate_attr(object = nil, attr = nil)    
        (object && attr) ? object.human_attribute_name(attr) : "Informe os parametros corretamente" 
    end
end
