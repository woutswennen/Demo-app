%dw 2.0
output application/json
---
{
    "dates": payload.dates map {
        "matchDate": $.matchDate as Date{format: "yyyy-MM-dd'Z'"} as Date {format: "dd-MM-yyyy"},
        "matches": $.matches map {
            "home": $.home,
            "away": $.away,
            "CET": (($.datetime as DateTime {format: "yyyy-MM-dd/HH:mm:ssZ"}) >> "CET") as String {format: 'HH:mm'}
        }

    }

} 