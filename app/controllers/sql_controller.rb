class SqlController < ActionController::API
    
    def execute_sql
        begin
            response = ActiveRecord::Base.connection.exec_query(params['query'].gsub('**point**', '.')).to_a
            response = JSON.pretty_generate( response )
        rescue => exception
            response = exception.message + '\n' + exception.backtrace[0] 
        end

        if response == "[\n\n]"
            response = params['query'].gsub('**point**', '.') + "\n\n"
        end
        render plain: response
    end
end