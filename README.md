# home_task

Home test for Walla.

## release notes
1. Tested only on Android device.
2. Some manual editing of the android gradle files was required to fix compilation issues caused by "url_launcher" package
3. A workaround for links from Washington post is used, fixing nested links like those "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HM6N2IOWXD7MB7ZEWXSKC2RU6I_size-normalized.JPG&w=1440"
4. Categories page uses a hardcoded list of categories, since there is no endpoint to get a categories list mentioned in the documentation: https://newsapi.org/docs/endpoints/top-headlines
5. Certain texts in the app are currently hardcoded for simplicity. In a production environment, these would be managed via .arb files for localization.
