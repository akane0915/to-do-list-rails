require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe(".not_done") do
    it("displays tasks that are not yet complete") do
      not_done_task = Task.create(description: "gotta do it", done: false)
      done_task = Task.create({:description => "dishes", :done => true})
      expect(Task.not_done).to(eq([not_done_task]))
    end
  end
end
