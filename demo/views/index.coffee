@printout = (z) -> for x,y of z # i(z).split ','
	p -> "#{x} = #{if typeof y is 'object' then Object.keys y else typeof y}"
	# "#{x} = #{z[x]}"

form =>
	# p => "#{@locals} #{@}"
	p ->
	# '-----------'
	# 'whatee'
		textField 'name', label: { class: 'foo' }, input: { class: 'bar'}


# text @partial './partial'

# text 'vageemm'
# @include 'partial'
# inc 'partial'
# partial '/views/partial.coffee'
# coffeescript ->
	# console.log(util.inspect text)
# include 'partial'
# alsoInc 'partial'
# text @partial 'partial'
# text "third partial: #{@partial 'partial'}"

# coffeescript ->
#     console.log "#{i global}"
#     console.log "#{i this}"

# for x in i(global).split(',')
#     p -> x
# div "#this", i(this).split(',')

@printout @

# glasses
