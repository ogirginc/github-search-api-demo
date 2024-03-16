# GitHub Search API Demo

## How to run the project locally

### Requirements
- Ruby 3.3.0
- Rails 7.1.3

### Steps

1. Clone the repository to your local.
```
gh repo clone ogirginc/github-search-api-demo
```
2. Start the rails server
```
bin/rails server
```
3. Send a GET request like
```
http://localhost:3000/github_search.json?q=ogulcan&order=asc&sort=name&per_page=10&page=1
```

## How to run tests

Use the built in testing command:
```
bin/rails test
```

## Examples

<details>
<summary> Search the term `ogulcan` & sort the results by `name`.</summary>

**Request**

```
http://localhost:3000/github_search.json?q=ogulcan&order=asc&sort=name&per_page=10&page=1
```

**Response**

```json
{
  "data": [
    {
      "attributes": {
        "author": "ogimogi98",
        "name": "180501045_OgulcanYildirim",
        "repository_url": "https://github.com/ogimogi98/180501045_OgulcanYildirim",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "Alioglcn",
        "name": "Ali_Ogulcan_Et_Asignment1",
        "repository_url": "https://github.com/Alioglcn/Ali_Ogulcan_Et_Asignment1",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "Frontend-Bootcamp-Istanbul",
        "name": "burger-builder-homework-1-ogulcanturk",
        "repository_url": "https://github.com/Frontend-Bootcamp-Istanbul/burger-builder-homework-1-ogulcanturk",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "ogulcansahna",
        "name": "CardviewProjectHW",
        "repository_url": "https://github.com/ogulcansahna/CardviewProjectHW",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "CanCelik24",
        "name": "celik-ui",
        "repository_url": "https://github.com/CanCelik24/celik-ui",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "ogirginc",
        "name": "dotfiles",
        "repository_url": "https://github.com/ogirginc/dotfiles",
        "stars": 11
      }
    },
    {
      "attributes": {
        "author": "Ogulcan3232",
        "name": "ESINGREPO-",
        "repository_url": "https://github.com/Ogulcan3232/ESINGREPO-",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "Exp-Primer-Copilot-Cohort-1",
        "name": "experience-primer-copilot-ogulcanguldiken",
        "repository_url": "https://github.com/Exp-Primer-Copilot-Cohort-1/experience-primer-copilot-ogulcanguldiken",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "ozcanbatuhan",
        "name": "FinalProject",
        "repository_url": "https://github.com/ozcanbatuhan/FinalProject",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "HKPAU",
        "name": "Haber-Sitesi-Hasan-Kacar-Ogulcan-Dogan",
        "repository_url": "https://github.com/HKPAU/Haber-Sitesi-Hasan-Kacar-Ogulcan-Dogan",
        "stars": 0
      }
    }
  ]
}
```

</details>

<details>
<summary> Search the term `ogulcan` & sort the results by `stars`.</summary>

**Request**

```
http://localhost:3000/github_search.json?q=ogulcan&order=desc&sort=stars&per_page=5&page=1
```

**Response**

```json
{
  "data": [
    {
      "attributes": {
        "author": "ogirginc",
        "name": "dotfiles",
        "repository_url": "https://github.com/ogirginc/dotfiles",
        "stars": 11
      }
    },
    {
      "attributes": {
        "author": "ogulcandeniz-inac",
        "name": "ogulcandeniz-inac",
        "repository_url": "https://github.com/ogulcandeniz-inac/ogulcandeniz-inac",
        "stars": 1
      }
    },
    {
      "attributes": {
        "author": "freefriendcan",
        "name": "ogulcan.github.io",
        "repository_url": "https://github.com/freefriendcan/ogulcan.github.io",
        "stars": 1
      }
    },
    {
      "attributes": {
        "author": "Ogulcan3232",
        "name": "ESINGREPO-",
        "repository_url": "https://github.com/Ogulcan3232/ESINGREPO-",
        "stars": 0
      }
    },
    {
      "attributes": {
        "author": "ogulcanakbasli10",
        "name": "ogulcanakbasli10",
        "repository_url": "https://github.com/ogulcanakbasli10/ogulcanakbasli10",
        "stars": 0
      }
    }
  ]
}
```

</details>
