module Enumerable
	def fdist(&block)
		inject({}) do |memo, element|
			if block_given?
				item = block.call(element)
			else
				item = element
			end

			memo[item] ||= 0
			memo[item] += 1
			memo
		end
		.sort_by(&:last)
	end
	def commonest
		fdist.last.first
	end
end