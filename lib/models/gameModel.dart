class Game {
  SearchMetadata searchMetadata;
  SearchParameters searchParameters;
  SearchInformation searchInformation;
  List<LocalResults> localResults;
  List<DiscoverMorePlaces> discoverMorePlaces;
  Pagination pagination;
  SerpapiPagination serpapiPagination;

  Game(
      {this.searchMetadata,
      this.searchParameters,
      this.searchInformation,
      this.localResults,
      this.discoverMorePlaces,
      this.pagination,
      this.serpapiPagination});

  Game.fromJson(Map<String, dynamic> json) {
    searchMetadata = json['search_metadata'] != null
        ? new SearchMetadata.fromJson(json['search_metadata'])
        : null;
    searchParameters = json['search_parameters'] != null
        ? new SearchParameters.fromJson(json['search_parameters'])
        : null;
    searchInformation = json['search_information'] != null
        ? new SearchInformation.fromJson(json['search_information'])
        : null;
    if (json['local_results'] != null) {
      localResults = new List<LocalResults>();
      json['local_results'].forEach((v) {
        localResults.add(new LocalResults.fromJson(v));
      });
    }
    if (json['discover_more_places'] != null) {
      discoverMorePlaces = new List<DiscoverMorePlaces>();
      json['discover_more_places'].forEach((v) {
        discoverMorePlaces.add(new DiscoverMorePlaces.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    serpapiPagination = json['serpapi_pagination'] != null
        ? new SerpapiPagination.fromJson(json['serpapi_pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchMetadata != null) {
      data['search_metadata'] = this.searchMetadata.toJson();
    }
    if (this.searchParameters != null) {
      data['search_parameters'] = this.searchParameters.toJson();
    }
    if (this.searchInformation != null) {
      data['search_information'] = this.searchInformation.toJson();
    }
    if (this.localResults != null) {
      data['local_results'] = this.localResults.map((v) => v.toJson()).toList();
    }
    if (this.discoverMorePlaces != null) {
      data['discover_more_places'] =
          this.discoverMorePlaces.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.serpapiPagination != null) {
      data['serpapi_pagination'] = this.serpapiPagination.toJson();
    }
    return data;
  }
}

class SearchMetadata {
  String id;
  String status;
  String jsonEndpoint;
  String createdAt;
  String processedAt;
  String googleUrl;
  String rawHtmlFile;
  double totalTimeTaken;

  SearchMetadata(
      {this.id,
      this.status,
      this.jsonEndpoint,
      this.createdAt,
      this.processedAt,
      this.googleUrl,
      this.rawHtmlFile,
      this.totalTimeTaken});

  SearchMetadata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    jsonEndpoint = json['json_endpoint'];
    createdAt = json['created_at'];
    processedAt = json['processed_at'];
    googleUrl = json['google_url'];
    rawHtmlFile = json['raw_html_file'];
    totalTimeTaken = json['total_time_taken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['json_endpoint'] = this.jsonEndpoint;
    data['created_at'] = this.createdAt;
    data['processed_at'] = this.processedAt;
    data['google_url'] = this.googleUrl;
    data['raw_html_file'] = this.rawHtmlFile;
    data['total_time_taken'] = this.totalTimeTaken;
    return data;
  }
}

class SearchParameters {
  String engine;
  String q;
  String locationRequested;
  String locationUsed;
  String googleDomain;
  String hl;
  String gl;
  String device;
  String tbm;

  SearchParameters(
      {this.engine,
      this.q,
      this.locationRequested,
      this.locationUsed,
      this.googleDomain,
      this.hl,
      this.gl,
      this.device,
      this.tbm});

  SearchParameters.fromJson(Map<String, dynamic> json) {
    engine = json['engine'];
    q = json['q'];
    locationRequested = json['location_requested'];
    locationUsed = json['location_used'];
    googleDomain = json['google_domain'];
    hl = json['hl'];
    gl = json['gl'];
    device = json['device'];
    tbm = json['tbm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['engine'] = this.engine;
    data['q'] = this.q;
    data['location_requested'] = this.locationRequested;
    data['location_used'] = this.locationUsed;
    data['google_domain'] = this.googleDomain;
    data['hl'] = this.hl;
    data['gl'] = this.gl;
    data['device'] = this.device;
    data['tbm'] = this.tbm;
    return data;
  }
}

class SearchInformation {
  String localResultsState;
  String queryDisplayed;

  SearchInformation({this.localResultsState, this.queryDisplayed});

  SearchInformation.fromJson(Map<String, dynamic> json) {
    localResultsState = json['local_results_state'];
    queryDisplayed = json['query_displayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['local_results_state'] = this.localResultsState;
    data['query_displayed'] = this.queryDisplayed;
    return data;
  }
}

class LocalResults {
  int position;
  String title;
  String placeId;
  String lsig;
  String placeIdSearch;
  double rating;
  String type;
  String address;
  String thumbnail;
  GpsCoordinates gpsCoordinates;
  int reviews;
  String hours;

  LocalResults(
      {this.position,
      this.title,
      this.placeId,
      this.lsig,
      this.placeIdSearch,
      this.rating,
      this.type,
      this.address,
      this.thumbnail,
      this.gpsCoordinates,
      this.reviews,
      this.hours});

  LocalResults.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    title = json['title'];
    placeId = json['place_id'];
    lsig = json['lsig'];
    placeIdSearch = json['place_id_search'];
    rating = json['rating'];
    type = json['type'];
    address = json['address'];
    thumbnail = json['thumbnail'];
    gpsCoordinates = json['gps_coordinates'] != null
        ? new GpsCoordinates.fromJson(json['gps_coordinates'])
        : null;
    reviews = json['reviews'];
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['title'] = this.title;
    data['place_id'] = this.placeId;
    data['lsig'] = this.lsig;
    data['place_id_search'] = this.placeIdSearch;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['address'] = this.address;
    data['thumbnail'] = this.thumbnail;
    if (this.gpsCoordinates != null) {
      data['gps_coordinates'] = this.gpsCoordinates.toJson();
    }
    data['reviews'] = this.reviews;
    data['hours'] = this.hours;
    return data;
  }
}

class GpsCoordinates {
  double latitude;
  double longitude;

  GpsCoordinates({this.latitude, this.longitude});

  GpsCoordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class DiscoverMorePlaces {
  String title;
  String places;
  String link;
  String serpapiLink;
  String thumbnail;

  DiscoverMorePlaces(
      {this.title, this.places, this.link, this.serpapiLink, this.thumbnail});

  DiscoverMorePlaces.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    places = json['places'];
    link = json['link'];
    serpapiLink = json['serpapi_link'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['places'] = this.places;
    data['link'] = this.link;
    data['serpapi_link'] = this.serpapiLink;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Pagination {
  int current;
  String next;
  OtherPages otherPages;

  Pagination({this.current, this.next, this.otherPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    next = json['next'];
    otherPages = json['other_pages'] != null
        ? new OtherPages.fromJson(json['other_pages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['next'] = this.next;
    if (this.otherPages != null) {
      data['other_pages'] = this.otherPages.toJson();
    }
    return data;
  }
}

class OtherPages {
  String s2;
  String s3;
  String s4;
  String s5;
  String s6;
  String s7;

  OtherPages({this.s2, this.s3, this.s4, this.s5, this.s6, this.s7});

  OtherPages.fromJson(Map<String, dynamic> json) {
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    return data;
  }
}

class SerpapiPagination {
  int current;
  String nextLink;
  String next;
  OtherPages otherPages;

  SerpapiPagination({this.current, this.nextLink, this.next, this.otherPages});

  SerpapiPagination.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    nextLink = json['next_link'];
    next = json['next'];
    otherPages = json['other_pages'] != null
        ? new OtherPages.fromJson(json['other_pages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['next_link'] = this.nextLink;
    data['next'] = this.next;
    if (this.otherPages != null) {
      data['other_pages'] = this.otherPages.toJson();
    }
    return data;
  }
}
