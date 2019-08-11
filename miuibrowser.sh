#!/system/bin/sh

DATA=/data/data/com.android.browser/files/data

DIRS=(yellowpagev6n suggest list kw2 homepagecards customheadcontent banners)

for dir in ${DIRS[@]}
do
  if [ -s $dir ]
    then
      rm -r $dir && touch $dir && chmod 444 $dir && chattr +i $dir
        echo -e "\e[0;31m Ban $dir OK !!! \e[0m "
  else
    echo -e "\e[0;36m $dir already baned !!! \e[0m "
  fi
done

echo "开始更改搜索引擎"
chattr -i /data/data/com.android.browser/files/data/searchengine/searchengine-zh-rCN-f198d1a8f090029f8154d90f3f5398ec/searchengine.json
chmod 0777 /data/data/com.android.browser/files/data/searchengine/searchengine-zh-rCN-f198d1a8f090029f8154d90f3f5398ec/searchengine.json
cat>/data/data/com.android.browser/files/data/searchengine/searchengine-zh-rCN-f198d1a8f090029f8154d90f3f5398ec/searchengine.json<<EOF
{
"specifiedCount":0,
"unSpecifiedCount":0,
"ehash":"0146593001203c66efafcaa93fb4dbed",
"changeEngine":2,
"data":{
  "1":{
    "title_zh_CN":"秘迹搜",
    "title_zh_TW":"秘迹搜",
    "title_en_US":"baidu",
    "label":"mijisou",
    "keyword":"mijisou.com",
    "favicon_uri":"",
    "search_uri":"https:\/\/m.mijisou.com\/?q={searchTerms}",
    "encoding":"UTF-8",
    "suggest_uri":"http:\/\/suggestion.baidu.com\/su?p=3&wd={searchTerms}",
    "extra":"v6",
    "show_suggest_app":0,
    "ic_search_engine":"http:\/\/t2.market.mi-img.com\/download\/Browser\/0567aa49cbabd453834a3d1dd46b7c54454ec55ef",
    "ic_search_logo":"",
    "miui_search_logo":"http:\/\/file.market.xiaomi.com\/download\/Browser\/1305f832-e9e5-4205-8964-c794b6bbbb3c",
    "ic_search_engine_v7":"https:\/\/cdn.leakzero.com\/mijisou\/themes\/entropage\/img\/favicon.png?staticVersion=1559562262",
    "ic_search_engine_white":"http:\/\/f4.market.mi-img.com\/download\/Browser\/01828647800094c1a0762e2a32d4d8e0f7b74dbbc"
    },
  "2":{
    "title_zh_CN":"多吉搜索",
    "title_zh_TW":"多吉搜索",
    "title_en_US":"dogedoge",
    "label":"dogedoge",
    "keyword":"dogedoge.com",
    "favicon_uri":"",
    "search_uri":"https:\/\/dogedoge.com\/results?q={searchTerms}",
    "encoding":"UTF-8",
    "suggest_uri":"https:\/\/www.dogedoge.com\/sugg\/{searchTerms}",
    "extra":"v6",
    "show_suggest_app":0,
    "ic_search_engine":"http:\/\/t2.market.mi-img.com\/download\/Browser\/0567aa49cbabd453834a3d1dd46b7c54454ec55ef",
    "ic_search_logo":"",
    "miui_search_logo":"http:\/\/file.market.xiaomi.com\/download\/Browser\/1305f832-e9e5-4205-8964-c794b6bbbb3c",
    "ic_search_engine_v7":"https:\/\/www.dogedoge.com\/assets\/doge_ico.png",
    "ic_search_engine_white":"http:\/\/f4.market.mi-img.com\/download\/Browser\/01828647800094c1a0762e2a32d4d8e0f7b74dbbc"
    },
  "3":{
    "title_zh_CN":"SandBox Google",
    "title_zh_TW":"SandBox Google",
    "title_en_US":"SandBox Google",
    "label":"SandBox Google",
    "keyword":"Google.com",
    "favicon_uri":"",
    "search_uri":"https:\/\/zjcqoo.github.io\/-----https:\/\/www.google.com\/search?q={searchTerms}",
    "encoding":"UTF-8",
    "suggest_uri":"http:\/\/suggestion.baidu.com\/su?p=3&wd={searchTerms}",
    "extra":"v6",
    "show_suggest_app":0,
    "ic_search_engine":"http:\/\/t2.market.mi-img.com\/download\/Browser\/0567aa49cbabd453834a3d1dd46b7c54454ec55ef",
    "ic_search_logo":"",
    "miui_search_logo":"http:\/\/file.market.xiaomi.com\/download\/Browser\/1305f832-e9e5-4205-8964-c794b6bbbb3c",
    "ic_search_engine_v7":"https:\/\/www.google.com\/images\/branding\/product\/1x\/gsa_android_144dp.png",
    "ic_search_engine_white":"http:\/\/f4.market.mi-img.com\/download\/Browser\/01828647800094c1a0762e2a32d4d8e0f7b74dbbc"
    },
  "4":{
    "title_zh_CN":"头条搜索",
    "title_zh_TW":"头条搜索",
    "title_en_US":"toutiao",
    "label":"toutiao",
    "keyword":"toutiao.com",
    "favicon_uri":"",
    "search_uri":"https:\/\/m.toutiao.com\/search\/?keyword={searchTerms}",
    "encoding":"UTF-8",
    "suggest_uri":"http:\/\/suggestion.baidu.com\/su?p=3&wd={searchTerms}",
    "extra":"v6",
    "show_suggest_app":0,
    "ic_search_engine":"http:\/\/t2.market.mi-img.com\/download\/Browser\/0567aa49cbabd453834a3d1dd46b7c54454ec55ef",
    "ic_search_logo":"",
    "miui_search_logo":"http:\/\/file.market.xiaomi.com\/download\/Browser\/1305f832-e9e5-4205-8964-c794b6bbbb3c",
    "ic_search_engine_v7":"https:\/\/m.toutiao.com\/favicon.ico",
    "ic_search_engine_white":"http:\/\/f4.market.mi-img.com\/download\/Browser\/01828647800094c1a0762e2a32d4d8e0f7b74dbbc"
    },
  "5":{
    "title_zh_CN":"夸克",
    "title_zh_TW":"夸克",
    "title_en_US":"quark",
    "label":"夸克",
    "keyword":"sm.cn",
    "favicon_uri":"",
    "search_uri":"http:\/\/quark.sm.cn\/search?q={searchTerms}",
    "encoding":"UTF-8","suggest_uri":"http:\/\/suggestion.baidu.com\/su?p=3&wd={searchTerms}",
    "extra":"v6",
    "show_suggest_app":0,
    "ic_search_engine":"http:\/\/f2.market.mi-img.com\/download\/Browser\/5c6ea0a7-b1a8-4210-831d-44f7e50ef02c",
    "ic_search_logo":"",
    "miui_search_logo":"http:\/\/f4.market.mi-img.com\/download\/Browser\/19821ec0-dc9c-4237-8026-dd7a430548f7",
    "ic_search_engine_v7":"http:\/\/f5.market.mi-img.com\/download\/Browser\/049995ae9ac321619b1f3e39699c746b12c4135ed",
    "ic_search_engine_white":"http:\/\/f5.market.mi-img.com\/download\/Browser\/0c8285778a0b94c17f762b2a33d4dcebfb040b286"
    },
  "6":{
    "title_zh_CN":"百度",
    "title_zh_TW":"百度",
    "title_en_US":"baidu",
    "label":"baidu",
    "keyword":"baidu.com",
    "favicon_uri":"",
    "search_uri":"http:\/\/m.baidu.com\/s?from=1002253t&word={searchTerms}",
    "encoding":"UTF-8",
    "suggest_uri":"http:\/\/suggestion.baidu.com\/su?p=3&wd={searchTerms}",
    "extra":"v6",
    "show_suggest_app":0
    }
  },
  "7":{
    "title_zh_CN":"必应",
    "title_zh_TW":"必应",
    "title_en_US":"bing",
    "label":"bing",
    "keyword":"bing.com",
    "favicon_uri":"",
    "search_uri":"https:\/\/bing.com\/?q={searchTerms}",
    "encoding":"UTF-8",
    "suggest_uri":"http:\/\/suggestion.baidu.com\/su?p=3&wd={searchTerms}",
    "extra":"v6",
    "show_suggest_app":0,
    "ic_search_engine":"http:\/\/t2.market.mi-img.com\/download\/Browser\/0567aa49cbabd453834a3d1dd46b7c54454ec55ef",
    "ic_search_logo":"",
    "miui_search_logo":"http:\/\/file.market.xiaomi.com\/download\/Browser\/1305f832-e9e5-4205-8964-c794b6bbbb3c",
    "ic_search_engine_v7":"https:\/\/cdn.leakzero.com\/mijisou\/themes\/entropage\/img\/favicon.png?staticVersion=1559562262",
    "ic_search_engine_white":"http:\/\/f4.market.mi-img.com\/download\/Browser\/01828647800094c1a0762e2a32d4d8e0f7b74dbbc"   
  },
"default_search_engine":{
  "name":"1",
  "isRecommended":true
  },
"search_engines":["7","1","2","4","3","5","6"]
}
EOF

echo "更改成功！"

chmod 0444 /data/data/com.android.browser/files/data/searchengine/searchengine-zh-rCN-f198d1a8f090029f8154d90f3f5398ec/searchengine.json
chattr +i /data/data/com.android.browser/files/data/searchengine/searchengine-zh-rCN-f198d1a8f090029f8154d90f3f5398ec/searchengine.json