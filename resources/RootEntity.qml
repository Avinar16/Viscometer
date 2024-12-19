import QtQuick

import Qt3D.Core 
import Qt3D.Render
import Qt3D.Extras
import Qt3D.Input 

import "."


Entity {
    id: root

    Camera {
        id: mainCamera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: 16/9
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d(0.0, 4, -3)
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d(0.0, 0.5, 0.0)
    }

    SOrbitCameraController {
        id: mainCameraController
        camera: mainCamera
    }

    components: [
        RenderSettings {

            Viewport {
                normalizedRect: Qt.rect(0.0, 0.0, 1.0, 1.0)
                RenderSurfaceSelector {
                    CameraSelector {
                        id: cameraSelector
                        camera: mainCamera
                        FrustumCulling {
                            ClearBuffers {
                                buffers: ClearBuffers.AllBuffers
                                clearColor: "#444449"
                                NoDraw {}
                            }
                            LayerFilter {
                                filterMode: LayerFilter.DiscardAnyMatchingLayers
                                layers: [topLayer]
                            }
                            LayerFilter {
                                filterMode: LayerFilter.AcceptAnyMatchingLayers
                                layers: [topLayer]
                                ClearBuffers {
                                    buffers: ClearBuffers.DepthBuffer
                                }
                            }
                        }
                    }
                }
            }
        },
        InputSettings {}
        ,
        ScreenRayCaster
        {
            id:screenRayCaster
            onHitsChanged:
            {
                drawLineMesh(hits)

            }

        }
    ]

    Layer {
        id: topLayer
        recursive: true
    }


    Entity {
        id: cubeEntity
        components: [
            CuboidMesh
            {
                xExtent: 1
                yExtent: 1
                zExtent: 1


            }

            ,

            Transform {
                id: t
                translation: Qt.vector3d(0, 0, 0)

            }
            ,
            PhongMaterial
            {
                ambient: "red"
            }


        ]

    }

}