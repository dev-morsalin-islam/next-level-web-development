


{


    type Developer = {
        category: string,
        technologies: string[]
    }

    
    type FrontEndDeveloper<T extends keyof Developer> = {
        [K in T]: Developer[K];

    
    }

    const frontEndDev: FrontEndDeveloper<
        "category" | "technologies"
    >={
        category: "front end",
        
        technologies: ["html", "css", "tailwindcss","react", "next.js"]
    }

}