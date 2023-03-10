import 'package:firebase_analytics/firebase_analytics.dart';

import 'item.dart';

class DataMock {
  static List<Item> items = [
    Item(title: 'AD', onTap: FirebaseAnalytics.instance.logAdImpression),
    Item(title: 'Cart', onTap: FirebaseAnalytics.instance.logAddToCart),
    Item(title: 'Login', onTap: FirebaseAnalytics.instance.logLogin),
    Item(title: 'Open app', onTap: FirebaseAnalytics.instance.logAppOpen),
    Item(
      title: 'Custom event',
      onTap: () {
        FirebaseAnalytics.instance.logEvent(name: 'custom_event');
      },
    ),
    Item(
      title: 'Share',
      onTap: () {
        FirebaseAnalytics.instance.logShare(
          contentType: 'contentType',
          itemId: 'itemId',
          method: 'method',
        );
      },
    ),
    Item(
      title: 'Search',
      onTap: () {
        FirebaseAnalytics.instance.logSearch(searchTerm: 'whatever');
      },
    ),
    Item(
      title: 'Payment',
      onTap: () {
        FirebaseAnalytics.instance.logAddPaymentInfo(
            coupon: 'FREE00',
            value: 20.5,
            currency: 'RS',
            paymentType: 'CREDIT',
            items: [
              AnalyticsEventItem(),
            ]);
      },
    ),
  ];
}
