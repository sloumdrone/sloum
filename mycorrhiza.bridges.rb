##############################################
############~.Mycorrhiza.Bridges.~############
#################//by.Sloum\\#################
##############################################

counter = 0
counter2 = 0
counter3 = 0



with_fx :reverb, mix: 0.75, room: 1 do
  with_fx :echo, mix: 0.7, phase: 1, decay: 3 do
    live_loop :voiceone do
      play [:ef4, :g4, :bf4].choose, release: 4, attack: 4, pan: -0.75
      sleep 8
      if counter2 <= 13
        counter2 += 1
      else
        counter2 = 0
      end
      puts counter2, 'of 11'
    end
    
    
    live_loop :voicetwo do
      play [:af3, :ef3, :f3].choose, release: 3, attack: 2, pan: 0.75
      sleep 5
      if counter3 <= 15
        counter3 += 1
      else
        counter3 = 0
      end
      puts counter3, 'of 10'
    end
    
    live_loop :voicethree do
      play [:c3, :c4, :c2, :g2].choose, release: 5, attack: 5, pan: 1
      sleep 7
      if counter <= 7
        counter += 1
      else
        counter = 0
      end
      puts counter, 'of 5'
    end
  end
  
  live_loop :pianosound do
    if counter >= 5
      use_synth :piano
      play (scale :ef, :major_pentatonic, num_octaves: 1).choose, velocity: rrand(0.2, 0.5), hard: 0.3, pan: rrand(-1, 1)
      sleep [4, 4, 4, 2, 1, 2, 0.5, 4, 4].choose
    else
      sleep 1
    end
  end
end


live_loop :waves do
  if counter3 >= 11
    use_synth (ring :cnoise, :pnoise, :gnoise).choose
    play rrand(30, 60), cutoff: (ring 20, 80).tick, cutoff_slide: 3, attack: 4, release: 5, amp: rrand(0.18, 0.4)
    sleep [4,2,3,4,1].choose
  else
    sleep 1
  end
end

live_loop :tablastuff do
  if counter2 >= 10
    drumsound = [:tabla_tas1, :tabla_tas2, :tabla_tas3, :tabla_ke1, :tabla_ke2, :tabla_ke3, :tabla_na, :tabla_na_o, :tabla_tun1, :tabla_tun2, :tabla_tun3, :tabla_te1, :tabla_te2, :tabla_te_ne, :tabla_te_m, :tabla_ghe1, :tabla_ghe2, :tabla_ghe3, :tabla_ghe4, :tabla_ghe5, :tabla_ghe6, :tabla_ghe7, :tabla_ghe8, :tabla_dhec, :tabla_na_s, :tabla_re]
    sample drumsound.choose, amp: rrand(0.05,0.3), pan: rrand(-1,1) if (spread 3,7).tick(:drumtick)
    sample drumsound.choose, amp: rrand(0.05,0.3), pan: rrand(-1,1) if (spread 4,9).look(:drumtick)
    sleep 0.125
  else
    sleep 1
  end
end
