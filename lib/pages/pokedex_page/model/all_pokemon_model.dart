// To parse this JSON data, do
//
//     final allPokemonModel = allPokemonModelFromJson(jsonString);

import 'dart:convert';

class AllPokemonModel {
    AllPokemonModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<Result> results;

    factory AllPokemonModel.fromRawJson(String str) => AllPokemonModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllPokemonModel.fromJson(Map<String, dynamic> json) => AllPokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.name,
        this.url,
    });

    String name;
    String url;

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
