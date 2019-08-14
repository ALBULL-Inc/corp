class Dartslive
  attr_reader :logged_in

  def url_base;    "https://card.dartslive.com";          end
  def top_url;     "#{url_base}/t/top.jsp";               end
  def login_url;   "#{url_base}/entry/login/doLogin.jsp"; end
  def stats_url;   "#{url_base}/t/play/index.jsp";        end

  def imadoko_url; "#{url_base}/t/imadoko.jsp";           end
  def shop_url;    "http://www.dartslive.jp/kt/search/shop.jsp";   end
  def search_url;  "http://www.dartslive.jp/kt/search/search.jsp"; end
  def result_url;  "http://www.dartslive.jp/t/day/index.jsp";      end
  def geocode_url; "http://maps.google.com/maps/api/geocode/json"; end

  def initialize
    @agent = Mechanize.new
    @logged_in = false
  end

  def login!(account_id, passwd)
    @agent.post(login_url, {"id" => account_id, "ps" => passwd})
    if @agent.page.at('font[color=red]')
      raise AuthError, 'login error' if @agent.page.at('font[color=red]').inner_text.match('ERROR')
    end
    raise AuthError, "charge error"  if @agent.page.at('div[id=error]')
    @logged_in = true
    nil
  end

  def cardname
    @cardname ||= top_html.title.match(/DARTSLIVE \[(.+?)\]/)[1]
  end

  def rating
    @rating ||= @stats[:rating][:value]
  end

  def stats
    return @stats if @stats

    rating = stats_html.at("div[id=status]")
    rating_val = rating.at("span[id=statusRtValue]").text.to_i
    rating_detail = rating.at("span[id=refValue]").text.to_f

    avrg = stats_html.at("tr[class=statsAvg]")
    best = stats_html.at("tr[class=statsBest]")

    zeroone_avrg = avrg.at("td[class=stats01]" ).text.scan(/([\.\d]+)/).map(&:first).map(&:to_f)
    cricket_avrg = avrg.at("td[class=statsCri]").text.scan(/([\.\d]+)/).map(&:first).map(&:to_f)
    countup_avrg = avrg.at("td[class=statsPra]").text.scan(/([\.\d]+)/).map(&:first).map(&:to_f)
    countup_best = best.at("td[class=statsPra]").text.scan(/([\.\d]+)/).map(&:first).map(&:to_f)

    @stats = {
      rating:  {value: rating_val, detail: rating_detail},
      zeroone: {p80: zeroone_avrg[0], p100: zeroone_avrg[1]},
      cricket: {p80: cricket_avrg[0], p100: cricket_avrg[1]},
      countup: {ave: countup_avrg[0], best: countup_best[0]},
    }
  end

  private
    def top_html
      @top_html ||= @agent.get(top_url)
    end
    def stats_html
      @stats_html ||= @agent.get(stats_url)
    end
end
