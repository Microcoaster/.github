#!/bin/bash
# Le cycle de contribution : une issue, une branche, des commits, une
# review, la fusion. Cinq étapes reliées, parce que ce qui a un ordre ne
# se met pas dans une liste à puces.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/flow$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"
cat > "$D/html$SUF/f-org-cycle.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:250px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:250px;background:#0D1117;display:flex;align-items:center;padding:0 56px}
.card{flex:1;height:168px;background:#131A24;border:1px solid #1F2833;border-radius:12px;
      padding:18px 18px;display:grid;grid-template-rows:38px 24px 1fr;row-gap:9px}
.ico{width:38px;height:38px;display:flex;align-items:center;justify-content:center;
     border-radius:9px;background:#E4E8ED0F;border:1px solid #E4E8ED26}
h3{font-family:Syne,sans-serif;font-weight:800;font-size:17px;line-height:24px;color:#F0F4F8;white-space:nowrap}
p{font-family:'Space Grotesk',sans-serif;font-size:13px;line-height:1.45;color:#8B97A6}
code{font-family:'JetBrains Mono',monospace;font-size:12px;color:#C8D0DA}
.arr{width:34px;flex-shrink:0;display:flex;align-items:center;justify-content:center}
</style></head><body>
<div class="w">
  <div class="card">
    <div class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none">
      <circle cx="12" cy="12" r="8.5" stroke="#E4E8ED" stroke-width="1.8"/>
      <circle cx="12" cy="12" r="2.6" fill="#E4E8ED"/></svg></div>
    <h3>$(t 'Une issue' 'An issue')</h3><p>$(t "Elle décrit le travail avant qu'il commence, et garde la trace de la décision." 'It describes the work before it starts, and keeps a record of the decision.')</p>
  </div>
  <div class="arr"><svg width="20" height="12" viewBox="0 0 26 14" fill="none"><path d="M0 7h22M17 2l5 5-5 5" stroke="#2F3A47" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></div>
  <div class="card">
    <div class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none">
      <g stroke="#E4E8ED" stroke-width="1.8" stroke-linecap="round"><path d="M6.5 6.5v11"/><path d="M6.5 11h7a4 4 0 0 0 4-4v-.5"/></g>
      <circle cx="6.5" cy="4.5" r="2.4" stroke="#E4E8ED" stroke-width="1.8"/>
      <circle cx="6.5" cy="19.5" r="2.4" stroke="#E4E8ED" stroke-width="1.8"/>
      <circle cx="17.5" cy="4.5" r="2.4" stroke="#E4E8ED" stroke-width="1.8"/></svg></div>
    <h3>$(t 'Une branche' 'A branch')</h3><p>$(t "Elle part de <code>develop</code>, préfixée selon ce qu'elle apporte." 'It starts from <code>develop</code>, prefixed by what it brings.')</p>
  </div>
  <div class="arr"><svg width="20" height="12" viewBox="0 0 26 14" fill="none"><path d="M0 7h22M17 2l5 5-5 5" stroke="#2F3A47" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></div>
  <div class="card">
    <div class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none">
      <circle cx="12" cy="12" r="3.6" stroke="#E4E8ED" stroke-width="1.8"/>
      <path d="M2.5 12h5.9M15.6 12h5.9" stroke="#E4E8ED" stroke-width="1.8" stroke-linecap="round"/></svg></div>
    <h3>$(t 'Des commits' 'Commits')</h3><p>$(t 'Réguliers et lisibles, au format <code>type: description</code>.' 'Regular and readable, in the <code>type: description</code> format.')</p>
  </div>
  <div class="arr"><svg width="20" height="12" viewBox="0 0 26 14" fill="none"><path d="M0 7h22M17 2l5 5-5 5" stroke="#2F3A47" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></div>
  <div class="card">
    <div class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none">
      <g stroke="#E4E8ED" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M17.5 7v6.5"/><path d="M6.5 7v10"/><path d="M6.5 7h7.5l-2.5-2.5M14 7l-2.5 2.5"/></g>
      <circle cx="6.5" cy="19.4" r="2.2" stroke="#E4E8ED" stroke-width="1.8"/>
      <circle cx="17.5" cy="4.6" r="2.2" stroke="#E4E8ED" stroke-width="1.8"/>
      <circle cx="17.5" cy="15.6" r="2.2" stroke="#E4E8ED" stroke-width="1.8"/></svg></div>
    <h3>$(t 'Une review' 'A review')</h3><p>$(t 'La pull request revient sur <code>develop</code> et passe sous un autre regard.' 'The pull request comes back onto <code>develop</code> and passes under another pair of eyes.')</p>
  </div>
  <div class="arr"><svg width="20" height="12" viewBox="0 0 26 14" fill="none"><path d="M0 7h22M17 2l5 5-5 5" stroke="#2F3A47" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></div>
  <div class="card">
    <div class="ico"><svg width="20" height="20" viewBox="0 0 24 24" fill="none">
      <path d="M5 12.5l4.5 4.5L19 7.5" stroke="#E4E8ED" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round"/></svg></div>
    <h3>$(t 'La fusion' 'The merge')</h3><p>$(t 'Jamais de push direct sur <code>main</code> ni sur <code>develop</code>.' 'Never a direct push to <code>main</code> or to <code>develop</code>.')</p>
  </div>
</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=12000 --force-device-scale-factor=2 \
  --screenshot="$B/flow$SUF/org-cycle.png" --window-size=1280,250 "file:///$B/html$SUF/f-org-cycle.html" >/dev/null 2>&1
echo "  org-cycle.png"
