//
//  ViewController.swift
//  AdaptiveCardsDemo
//
//  Created by Hemant Gore on 07/03/20.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    //MARK: - Lifecycle methods
    override func viewDidLoad() {
            super.viewDidLoad()
        }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // call setup card
        setupADCard()
    }

    /// Setup Adaptive Card
    private func setupADCard() {
            let jsonStr = """
    {
        "type": "AdaptiveCard",
        "version": "1.0",
        "id": "MeetingsFromUserCard",
        "body": [
            {
                "type": "Container",
                "backgroundImage": "https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/1904265/300/200/m1/fpc/wm0/ruu80qkd4njg10u5ext9og3hdns88jzutyclveanrhxr14p9jtohnmbwvpt2lwg6-.jpg?1479298829&s=21a788625c1c83a37a7d13cc462f3855",

                "items": [
                    {
                        "type": "ColumnSet",
                        "columns": [
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "ColumnSet",
                                        "columns": [
                                            {
                                                "type": "Column",
                                                "width": 60,
                                                "items": [
                                                    {
                                                        "type": "ColumnSet",
                                                        "columns": [
                                                            {
                                                                "type": "Column",
                                                                "width": "auto",
                                                                "items": [
                                                                    {
                                                                        "type": "Image",
                                                                        "size": "Small",
                                                                        "url": "data:image/png;base64,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",
                                                                        "horizontalAlignment": "Center",
                                                                        "width": "40px",
                                                                        "height": "35px"
                                                                    }
                                                                ],
                                                                "verticalContentAlignment": "Center",
                                                                "height": "stretch",
                                                                "horizontalAlignment": "Center"
                                                            },
                                                            {
                                                                "type": "Column",
                                                                "width": "stretch",
                                                                "items": [
                                                                    {
                                                                        "type": "TextBlock",
                                                                        "size": "Large",
                                                                        "weight": "Bolder",
                                                                        "color": "Light",
                                                                        "text": "Upcoming meeting",
                                                                        "wrap": true
                                                                    }
                                                                ],
                                                                "verticalContentAlignment": "Center",
                                                                "height": "stretch"
                                                            }
                                                        ],
                                                        "height": "stretch"
                                                    },
                                                    {
                                                        "type": "ColumnSet",
                                                        "columns": [
                                                            {
                                                                "type": "Column",
                                                                "width": "auto",
                                                                "items": [
                                                                    {
                                                                        "type": "Image",
                                                                        "url": "data:image/png;base64,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",
                                                                        "height": "20px"
                                                                    }
                                                                ],
                                                                "verticalContentAlignment": "Center",
                                                                "height": "stretch"
                                                            },
                                                            {
                                                                "type": "Column",
                                                                "width": "auto",
                                                                "items": [
                                                                    {
                                                                        "type": "TextBlock",
                                                                        "size": "Medium",
                                                                        "color": "Light",
                                                                        "text": "**1-1** of 1",
                                                                        "horizontalAlignment": "Center"
                                                                    }
                                                                ],
                                                                "verticalContentAlignment": "Center",
                                                                "spacing": "Small"
                                                            },
                                                            {
                                                                "type": "Column",
                                                                "width": "auto",
                                                                "items": [
                                                                    {
                                                                        "type": "Image",
                                                                        "url": "data:image/png;base64,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",
                                                                        "height": "20px"
                                                                    }
                                                                ],
                                                                "verticalContentAlignment": "Center",
                                                                "spacing": "Small",
                                                                "horizontalAlignment": "Center"
                                                            }
                                                        ],
                                                        "height": "stretch"
                                                    }
                                                ],
                                                "height": "stretch"
                                            }
                                        ],
                                        "height": "stretch"
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },
            {
                "type": "Container",
                "id": "EventItemContainer",
                "items": [
                    {
                        "type": "Container",
                        "items": [
                            {
                                "type": "TextBlock",
                                "weight": "Bolder",
                                "text": "TUESDAY, FEBRUARY 11"
                            }
                        ],
                        "style": "emphasis"
                    },
                    {
                        "type": "Container",
                        "items": [
                            {
                                "type": "ColumnSet",
                                "columns": [
                                    {
                                        "type": "Column",
                                        "width": 20,
                                        "items": [
                                            {
                                                "type": "TextBlock",
                                                "size": "Medium",
                                                "weight": "Bolder",
                                                "color": "Dark",
                                                "text": "14:15",
                                                "horizontalAlignment": "Center",
                                                "spacing": "Medium"
                                            },
                                            {
                                                "type": "TextBlock",
                                                "text": "30m",
                                                "horizontalAlignment": "Center",
                                                "spacing": "Small"
                                            }
                                        ],
                                        "style": "emphasis",
                                        "verticalContentAlignment": "Center"
                                    },
                                    {
                                        "type": "Column",
                                        "width": 80,
                                        "items": [
                                            {
                                                "type": "TextBlock",
                                                "size": "Medium",
                                                "weight": "Bolder",
                                                "text": "Meeting Start 2020-02-11T18:15",
                                                "spacing": "Medium",
                                                "separator": true
                                            },
                                            {
                                                "type": "TextBlock",
                                                "color": "Accent",
                                                "text": "",
                                                "spacing": "None",
                                                "separation": "none"
                                            }
                                        ],
                                        "style": "emphasis"
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ],
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json"
    }
    """

            let cardParseResult = ACOAdaptiveCard.fromJson(jsonStr)

            let path: String = Bundle.main.path(forResource: "host_config", ofType: "json")!

            if let hostConfig = try? String(contentsOfFile: path, encoding: String.Encoding.utf8), let parseResult = ACOHostConfig.fromJson(hostConfig), parseResult.isValid {


                if((cardParseResult?.isValid)!) {
                    let renderResult = ACRRenderer.render(cardParseResult!.card, config: parseResult.config, widthConstraint: 335);

                    if(renderResult?.succeeded ?? false)
                    {
                        let ad = renderResult?.view;
                        ad!.acrActionDelegate = (self as ACRActionDelegate);
                        self.view.autoresizingMask = [.flexibleHeight];
                        self.view.addSubview(ad!);
                        ad!.translatesAutoresizingMaskIntoConstraints = false;

                        NSLayoutConstraint(item: ad!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true;
                        NSLayoutConstraint(item: ad!, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 3).isActive = true;
                    }
                } else {
                    print("cardParseResult.isValid", cardParseResult?.isValid)
                }
            }
        }

}

//MARK: - AC Action Delegate
extension ViewController: ACRActionDelegate {
    func didFetchUserResponses(_ card: ACOAdaptiveCard, action: ACOBaseActionElement)
           {
               if(action.type == ACRActionType.openUrl){
                   let url = URL.init(string:action.url());
                   let svc = SFSafariViewController.init(url: url!);
                   self.present(svc, animated: true, completion: nil);
               }
           }
}
