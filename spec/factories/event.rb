Factory.define(:event) do |e|
  e.sequence(:title) { |n| "Event #{n}" }
end
