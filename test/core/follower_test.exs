defmodule CodeCamp2016.Core.FollowerTest do
  use ExUnit.Case

  @follower_ids [1289786120, 44629035, 19808555, 131260699, 795792933018537987, 39287567, 790292547910250497, 787144938102239232, 752798542641659904, 148172096, 781585419666395136, 433116137, 180327632, 768611754519760896, 764364446328172544, 102823976, 627457011, 752973633706823680, 36406585, 1379780730, 747442788216692736, 3029484028, 2149423587, 430072103, 634998919, 120459392, 2768128694, 734774828285210625, 397608375, 730842402475237377, 31264146, 719888091872239618, 3940636932, 95990675, 61720670, 193896371, 219835603, 146351574, 125080488, 702175972255117312, 84686307, 1056568477, 703969119389949953, 4909770974, 2409394874, 25734165, 1674967170, 17819549, 253116745]

  @follow_back [1289786120,  433116137, 219835603]

  describe "Find follower" do
    test "given an username it should return his followers ids" do
      ids = CodeCamp2016.Core.Follower.followers_ids("sohjiro")
      assert ids == @follower_ids
    end

    test "given two usernames find common followers" do
      common_followers = CodeCamp2016.Core.Follower.match_followers("sohjiro", "misaelpc")
      assert common_followers == MapSet.new([1289786120, 2768128694])
    end
  end

  describe "Find friends" do
    test "Given an username should find uses that follow back" do
      ids = CodeCamp2016.Core.Follower.followback("sohjiro")
      assert ids == @follow_back
    end
  end

end
