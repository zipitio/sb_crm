module ClientsHelper
	def sort_link(column:, label:)
		if column == params[:column]
			link_to(label, list_clients_path(column: column, direction: next_direction))
		else
			link_to(label, list_clients_path(column:column, direction: 'asc'))
		end
	end

	def next_direction
		params[:direction] == 'asc' ? 'desc' : 'asc'
	end
end
