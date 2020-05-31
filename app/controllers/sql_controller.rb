class SqlController < ActionController::API
    
    def execute_sql
        response = "Ошибка выполнения"

        begin
            response = ActiveRecord::Base.connection.exec_query(params['query']).to_hash
        rescue => exception
            response = exception.message + '\n' + exception.backtrace[0] 
        end
        render plain: response
    end
end