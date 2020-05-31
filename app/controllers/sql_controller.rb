class SqlController < ActionController::API
    
    def execute_sql
        begin
            response = ActiveRecord::Base.connection.exec_query(params['query']).to_a
            response = JSON.pretty_generate( response )
        rescue => exception
            response = exception.message + '\n' + exception.backtrace[0] 
        end
        render plain: response
    end
end