################################################################
########################VERSE1##################################
###############by###Sloum#######################################
###############################################09/16############
################################################################

#modifiable variables to alter progression and sound

chordlift = 0.25 #Anything > 0.99 seems to knock out the bass.

lead_in = 1 #0/1
bass_in = 0 #0/1/2
melody_in = 1 #0/1/2
beat_in = 0 #0/1/2


#static variables
arpscale = :f3
leadmelody = (scale arpscale, :major_pentatonic, num_octaves: 4)
counter = 2


#start loop scripts
with_fx :echo, phase: 0.125 do
  live_loop :arp do
    sync :songstructure
    if lead_in == 1
      use_random_seed 3000
      use_synth :beep
      64.times do
        play leadmelody.choose, release: (chordlift - 0.25).abs, pan: rrand(-1,1), amp: 0.2 if one_in 3
        sleep 0.125
      end
    else
      sleep 8
    end
  end
end

live_loop :chordprogression do
  cue :songstructure
  if melody_in == 1
    4.times do
      play chord(:f3, :add9), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 0.25
      sample :elec_tick, amp: rrand(0.5, 0.9), pan: [-1,1].choose
      sleep 0.25
    end
    4.times do
      play chord(:d3, :add9), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 0.25
      sample :elec_tick, amp: rrand(0.5, 0.9), pan: [-1,1].choose
      sleep 0.25
    end
    4.times do
      play chord(:bf2, :add9), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 0.25
      sample :elec_tick, amp: rrand(0.5, 0.9), pan: [-1,1].choose
      sleep 0.25
    end
    4.times do
      play chord(:d3, :add11), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 0.25
      sample :elec_tick, amp: rrand(0.5, 0.9), pan: [-1,1].choose
      sleep 0.25
    end
  elsif melody_in == 2
    1.times do
      play chord(:d3, :add9), release: 1, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 1
    end
    16.times do
      play chord(:g3, :m7), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 0.0625
      sample :elec_tick, amp: rrand(0.5, 0.9), pan: [-1,1].choose
      sleep 0.0625
    end
    1.times do
      play chord(:ef3, :add9), release: 1, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
      sleep 1
    end
    if counter % 2 == 0
      6.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.125
        sample :elec_tick, amp: rrand(0.8, 0.9), pan: [-1,1].choose
        sleep 0.125
      end
      4.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.0625
        sample :elec_tick, amp: rrand(0.8, 0.9), pan: [-1,1].choose
        sleep 0.0625
      end
    else
      2.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.25
        sample :elec_tick, amp: rrand(0.7, 0.9), pan: [-1,1].choose
        sleep 0.25
      end
      1.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.125
        sample :elec_tick, amp: rrand(0.8, 0.9), pan: [-1,1].choose
        sleep 0.125
      end
      2.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.0625
        sample :elec_tick, amp: rrand(0.8, 0.9), pan: [-1,1].choose
        sleep 0.0625
      end
      1.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.125
        sample :elec_tick, amp: rrand(0.7, 0.9), pan: [-1,1].choose
        sleep 0.125
      end
      2.times do
        play chord(:a3, :minor), release: chordlift, amp: rrand(0.5, 0.8), pan: rrand(-0.5,0.5)
        sleep 0.0625
        sample :elec_tick, amp: rrand(0.8, 0.9), pan: [-1,1].choose
        sleep 0.0625
      end
    end
  else
    sleep 8
  end
  counter += 1
end




live_loop :bassline do
  sync :songstructure
  use_synth :fm
  bassline = (knit :f2, 8, :d2, 8, [:bf1, :bf2].choose, 8, :d2, 8)
  if bass_in == 1
    32.times do
      play bassline.tick, release: chordlift / 2
      sleep 0.25
    end
  elsif bass_in == 2
    play :d2, release: 0.75
    sleep 1
    2.times do
      sleep 0.25
      play :d2, release: 0.125
      sleep 0.25
      play :g2, release: 0.125
      sleep 0.25
      play :g2, release: 0.125
      sleep 0.25
    end
    play :ef2, release: 1.25
    sleep 2.25
    3.times do
      play :a2, release: 0.25
      sleep 0.25
    end
  else
    sleep 8
  end
end

live_loop :basicbeat do
  sync :songstructure
  if beat_in == 1
    7.times do
      beat_offset = [0.25,0.5].choose
      if beat_offset == 0.25
        sleep 0.25
      else
        sleep 0
      end
      sample :bd_klub, amp: 1
      sleep beat_offset
      sample :elec_mid_snare
      sample :bd_boom, amp: 0.3
      sleep 0.5
    end
    1.times do
      sample :bd_klub, amp: 1
      sleep 0.5
      sample :elec_mid_snare
      sample :bd_boom, amp: 0.3
      sleep 0.25
      sample :elec_mid_snare
      sleep 0.25
    end
  elsif beat_in == 2
    in_thread do
      1.times do
        sleep [0, 0.25, 0.5].choose
        sample :bd_klub
        sleep [0.50, 0.25].choose
        sample :ambi_swoosh, amp: 0.2
        sleep 0.25
      end
    end
    1.times do
      sleep 0.25
      sample :drum_cymbal_closed, cutoff: 80
      sleep 0.25
      sample :drum_snare_soft, cutoff: 90
      sleep 0.125
      sample :drum_snare_soft, cutoff: 100
      sleep 0.125
      sample :drum_cymbal_closed, cutoff: 80
      sleep 1.50
      sample :drum_cymbal_closed, cutoff: 90
      sleep 0.25
      sample :drum_snare_soft, cutoff: 90
      sleep 0.0625
      sample :drum_snare_soft, cutoff: 90
      sleep 0.0625
      sample :drum_snare_soft, cutoff: 90
      sleep 0.0625
      sample :drum_snare_soft, cutoff: 90
      sleep 0.0625
      sample :drum_cymbal_closed, cutoff: 80
      sleep 1.25
    end
  else
    sleep 8
  end
end
