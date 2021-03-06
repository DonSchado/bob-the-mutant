require 'spec_helper'
require 'bob'

describe Bob do
  let(:bob) { subject }
  it { expect(bob.hey('WATCH OUT!')).to eql('Woah, chill out!') }
  it { expect(bob.hey('Does this cryogenic chamber make me look fat?')).to eql('Sure.') }
  it { expect(bob.hey('1, 2, 3 GO!')).to eql('Woah, chill out!') }
  it { expect(bob.hey('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!')).to eql('Woah, chill out!') }
  it { expect(bob.hey('I HATE YOU')).to eql('Woah, chill out!') }
  it { expect(bob.hey('')).to eql('Fine. Be that way.') }
  it { expect(bob.hey(nil)).to eql('Fine. Be that way.') }
  it { expect(bob.hey("Let's go make out behind the gym!")).to eql('Whatever.') }
  it { expect(bob.hey('Ending with ? means a question.')).to eql('Whatever.') }
  it { expect(bob.hey('Tom-ay-to, tom-aaaah-to.')).to eql('Whatever.') }
end
